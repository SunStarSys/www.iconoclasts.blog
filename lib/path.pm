package path;

use SunStarSys::Util qw/walk_content_tree seed_file_deps seed_file_acl archived Load/;
use strict;
use warnings;

open my $fh, "<:encoding(UTF-8)", "lib/facts.yml" or die "Can't locate facts.yml data: $!";
my $facts = Load join "", <$fh>;
close $fh;

# the only job of this __PACKAGE__ is to fill out the @patterns, @acl, and %dependencies data structures.
#
# entries in @patterns are three-element arrayrefs:
# [
#   $pattern,     # first pattern to match the source file's "/content/"-rooted path wins
#   $method_name, # provided/implemented in view.pm
#   \%args,       # to be merged with "path" and "lang" args, and passed (by list value) to view's $method_name)
# ]
#
# entries in %dependencies have keys that represent source file names,
# with each corresponding value as an arrayref of source files that
# the key's subsequent built artifact depends on.
# we only unravel the %dependencies at incremental build time, not in full site builds.
#
# there are three entry points into the %dependencies hash:
# 1. via walk_content_tree() code-block logic
# 2. via a "dependencies" header entry in an md.* file (through seed_deps())
# 3. via the "dependencies" YAML hash at the bottom of the __DATA__ block below

our @patterns = (

# the "memoize" view corrects most of the speed problems with quick_deps == 3:

  [qr!/(index|sitemap)\.html!, sitemap => {
    compress   => 1,
    nest       => 1,
    markdown_search => 1,
    facts      => $facts,
  }],

  [qr!^/[^/]+/([^/]+)\.md[^/]*$!, snippet => {
    template        => "blog.html",
    view            => [qw/asymptote single_narrative/],
    preprocess      => 1,
    compress        => 1,
    facts           => $facts,
    archive_root    => "/archives",
    category_root   => "/categories",
    markdown_search => 1,
    permalink       => 1,
  }],

  [qr!/index.md[^/]*$!, single_narrative => {
    template        => "main.html",
    compress        => 1,
    preprocess      => 1,
    facts           => $facts,
    markdown_search => 1,
  }],

  [qr!^/(categories|archives)/.*\.md[^/]*!, memoize => {
    view       => [qw/set_template_from_capture ssi snippet single_narrative/],
    compress   => 1,
    facts      => $facts,
  }],

  [qr!\.tex[^/]*$!, pdflatex => {}],

  [qr!\.md[^/]*$!, single_narrative => {
    template        => "main.html",
    compress        => 1,
    preprocess      => 1,
    facts           => $facts,
    markdown_search => 1,
  }],

);

#snippet
our (%dependencies, @acl);

# entries computed below at build-time, or drawn from the .deps cache file

walk_content_tree {

  $File::Find::prune = 1, return if m#^/(images|css|js)\b#;

  return if -d "content/$_";

  seed_file_deps, seed_file_acl if /\.md[^\/]*$/;

  for my $lang (qw/en es de fr/) {

    if (/\.md\.$lang$/ or m!/index\.html\.$lang$! or m!/files/|/slides/|/bin/!) {
      push @{$dependencies{"/sitemap.html.$lang"}}, $_ if !archived;
    }

    if (s!/index\.html\.$lang$!!) {
      $dependencies{"$_/index.html.$lang"} = [
        grep s/^content// && !archived,
        glob("'content$_'/*.md.$lang"),
        glob("'content$_'/*/index.html.$lang")
      ];
      push @{$dependencies{"$_/index.html.$lang"}}, grep -f && s/^content// && !m!/index\.html\.$lang!,
        glob("'content$_'/*.$lang");
    }
  }
}
  and do {

    my @categories_glob = glob("content/categories/*/*");
    for my $lang (qw/en es de fr/) {
      push @{$dependencies{"/categories/index.html.$lang"}}, grep -f && s/^content// && !m!/index\.html\.$lang$!,
        @categories_glob if -f "content/categories/index.html.$lang";
    }

    while  (my ($k, $v) = each %{$facts->{dependencies}}) {
      push @{$dependencies{$k}}, grep $k ne $_, grep s/^content// && !archived, map glob("'content'$_"), ref $v ? @$v : split /[;,]?\s+/, $v;
    }

    open my $fh, "<:encoding(UTF-8)", "lib/acl.yml" or die "Can't open acl.yml: $!";
    push @acl, @{Load join "", <$fh>};
  };
#snippet

1;
