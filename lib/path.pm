package path;
use SunStarSys::Util qw/walk_content_tree Load/;
use strict;
use warnings;


my $conf = Load join "", <DATA>;

our @patterns = (
    [qr!^/sitemap\.html$!, sitemap => {
        headers    => {title => "Sitemap"},
        nest       => 1,
        quick_deps => 1,
        conf       => $conf,
    }],
    [qr!/index\.html$!, sitemap => {
        headers    => {title => "Index"},
        quick_deps => 1,
        sort_tables => 1,
	    nest       => 1,
        conf       => $conf,
    }],
    [qr!^/(essay|client)s/.*\.md(?:text)?$!,  set_template_from_capture => {
        view       => "single_narrative",
        preprocess => 0,
        conf       => $conf,
    }],
    [qr/\.md(?:text)?$/,  single_narrative => {
        template   => "main.html",
        preprocess => 1,
        conf       => $conf,
    }],
);

our %dependencies;

walk_content_tree {
    if (/\.md(?:text)?$/ or m!/index\.html$! or m!/files/!) {
        push @{$dependencies{"/sitemap.html"}}, $_;
    }
    if (s!/index\.html$!!) {
        $dependencies{"$_/index.html"} = [
            grep s/^content//, (glob("content$_/*.{md,mdtext,pl,pm}"),
                               glob("content$_/*/index.html"))
        ];
        push @{$dependencies{"$_/index.html"}}, grep -f && s/^content// && !m!/index\.html$!,
            glob("content$_/*") if m!/files\b!;
    }
};

push @{$dependencies{"/essays/files/index.html"}}, grep -f && s/^content// && !m!/index\.html$!,
    glob("content/essays/files/*/*");

1;


__DATA__
title: "SunStar Systems"
keywords: "perl,mod_perl,mod_apreq2,c,xs,httpd,apache,puppet,qmail,ezmlm,git,subversion,mysql,postgresql,linux,freebsd,solaris,devops"
