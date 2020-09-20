{% extends "main.html" %}

{% block content %}
<div class="breadcrumbs">
	{{ breadcrumbs|safe }}
	<a href="javascript:void(location.href='https://cms.sunstarsys.com/redirect?uri='+escape(location.href)+';action=edit')">
		<img src="/images/edit.png" />
	</a>
</div>
<h1>{{ headers.title }}</h1>

<div class="jumbotron">
{% filter markdown %}
<h2>SunStar Systems CMS</h2>
<div class="row">
<div class="col-lg-5">
<span class="text-success"><em>The Original Markdown JAM Stack.</em></span>&trade;

The <span class="text-white">SunStar Systems CMS</span> is an
<ul>
	<li>online,</li>
	<li>flexible,</li>
	<li>cost-effective,</li>
	<li>peak performance</li>
</ul>
Content Management System and Integrated Development Environment (IDE) for developing and maintaining static website content, potentially with some basic [CGI](https://en.wikipedia.org/wiki/Common_Gateway_Interface) / [SSI](https://en.wikipedia.org/wiki/Server_Side_Includes) features.

<h3>Here's the Pitch, IT / Marketing Decision Maker...</h3>
What differentiates this product from our competitors is the [CMS Technology](technology), and how it allows us to maintain very low operating costs while providing a superior service.  We pass the cost savings on to our **customers**, instead of our C-Suite executives. [Give us a call](/contact), **especially** if you are
<ul>
	<li>an IT government sector decision-maker with FedRAMP compliance requirements,</li>
 	<li>a technology company leader with a mountain of online product documentation and support sites (potentially offering binary downloads) to curate,</li>
	<li>a principled High Availability architect tired of dealing with single-points-of-failure inherent in SQL-based LAMP stacks,</li>
<li>or really any business-person dissatisfied with the cost structure of anything else out there, including free offerings bogging down your staff's time and energy.</li>
</ul>
<span class="text-white">It's time for a sea change in how you manage and deliver your site to your target audience.</span>

The switching costs are trivial in most circumstances: our default file layout and processing logic matches up well with any other static site generator (Jekyll, Pelican, Hugo, etc.).  Our extensive experience migrating sites both on to, and off of, the forerunner of this system at The Apache Software Foundation (The ASF) lets us say with conviction: *there is no vendor lock-in involved with our offering*.

But don't just take our word for it, see for yourselves what's typically involved in terms of build system customization by visiting [our viewvc source lib tree](https://vcs.sunstarsys.com/viewvc/public/cms-sites/www.sunstarsys.com/trunk/lib/).  Less than 100 LOC to provide the build logic for this website, and it includes sophisticated dependency management for auto-generation of a multilingual [SiteMap](/sitemap) and all directory indexes (like [this portion](#Details) of this particular page).

*The real win* is when you realize you have limitless control over which personnel have editorial rights to each resource in **your own** Subversion repository, and that you never need to perform the cost-benefit-analysis on your editorial changes (or *even your editor previews* with certain cloud-based products) that our competition expects of you, as you work on your own site in your own fashion.  Even your [dynamic content](reference#Dynamic Content) is built according to your needs and schedule, not ours.

Go at your own pace, use as many employees / previews / edits / commits / branches as you like, and only pay for what you *actually use* on our infrastructure. See our [CMS Plans](plans) for the current deals.

</div>
<div class="col-lg-7">
	<div class="embed-responsive embed-responsive-16by9">
	 	<iframe class="embed-responsive-item" style="margin-bottom:20px;max-width:560;max-height:315" src="https://www.youtube.com/embed/96m8G9jCiyA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</div>

<h3>Here's Why, Full Stack Developer / Content Author / DevOps Guru...</h3>
If you are tired of the per-seat licensing and per-CPU-cycle choices weighing you down whenever you need to fix a typo, [join us](/contact). If you are a regex-equipped lion tamer for decades of accumulated legacy HTML content, or just someone dissatisfied with the other options on the market and how they function at scale, we have something really special to offer you.

Never having to deal directly with a version control system, or even a static site generator, on your own personal computer is up to you. The online IDE is designed and ready for your **browser-only workflow** whenever you are.  In a pinch, even the mobile (browser) interface will get it done, *instantly*.

Multi-gigabyte source trees are simply no match for it &mdash; full site build durations are measured in *seconds*, not hours and minutes.  The system easily sustains over [`500 MB/s`](features) while processing your sources for full site builds, but given its <span class="text-white">unique, patent-pending dependency management</span> functionality, it almost never needs to resort to them:

<span class="text-success"><em>It only builds what you need built.</em></span>&trade;

This technology was first invented in late 2011 by members of the Apache Infrastructure Team. The phrase "[JAM Stack](https://jamstack.wtf)" was coined years later, by a group unaware of our prior art in this space.  But the [public record](http://web.archive.org/web/20120112045033/http://www.apache.org/dev/cms) is crystal clear, and this new offering by SunStar Systems is testimony to that original legacy and its true open source origins.

The system we created for The ASF has been running on autopilot for the past 6 years.  The only issues we had with it from a stability standpoint revolved around ZFS usage on FreeBSD 9.1, which was a work in progress back then.  The fact is that this CMS/IDE is just the CI / CD coordination hub for power users on CDN services (or similar), and those CDN's are where the action is for SLA performance on the JAM Stack.  If *our CMS system* goes down, your ability to modify your live site will be impacted, but the last-mile delivery to your actual site's consumers is unimpacted thereby.  If The ASF's history with this system is a guide, the likelihood of an unplanned downtime event is relatively remote, especially when compared to the version control system which underpins it.

<span class="text-white">Want to give it a quick spin to see how fast and easy it is?</span>

This website is self-hosted; all those hot-pink pencil squares [<img src="../images/edit.png" style="width:20px">](https://cms.sunstarsys.com/redirect?uri=https://www.sunstarsys.com/index) at the top right are live.  Feel free to poke around and experiment with anything you see!  The only thing you can't do is commit and watch your changes build and deploy; that's restricted to our personnel for obvious reasons.

Our global Point of Presence (POP) network ensures low-latency connections to both the CMS and the end-delivery websites we host.  We are currently on four continents and have a bicoastal presence within the US.  And we're expanding rapidly- next up East Asia!

</div>
</div>

### Feature Comparison Grid

<br />

| Feature          |  SunStar Systems | Netlify+Gatsby | GitHub+Hugo |
|:------------|:-------------:|:------------:|:----------:|
| CMS IDE	     | <span class="text-success">Y</span>  |    Y    |  <span class="text-info">?</span>  |
| CI / CD          | <span class="text-success">Y</span> | Y | <span class="text-danger">N</span> |
| FedRAMP Infrastructure + FIPS compliant TLS | <span class="text-success">Y</span> | <span class="text-danger">N</span> | <span class="text-danger">N</span> |
| Browser-Only Workflow (Mobile Friendly) | <span class="text-success">Y</span> | <span class="text-danger">N</span> | <span class="text-danger">N</span>  |
| Incremental Builds | <span class="text-success">Y</span> | Y | <span class="text-danger">N</span> |
| Unlimited Branch Builds | <span class="text-success">Y</span> | Y | Y (for public repos) |
| Scheduled Builds of Dynamic Content Only | <span class="text-success">Y</span> | <span class="text-danger">N</span> | <span class="text-danger">N</span> |
| Easy 3rd Party Contributor Workflow | <span class="text-success">Y</span> | Y | Y |
| No Per-Preview Billing | <span class="text-success">Y</span> | Enterprise Only ($$) | Y |
| No Per-Build Billing |  <span class="text-success">Y</span> | Enterprise Only ($$) | Y (for public repos)  |
| No Per-Seat Billing | <span class="text-success">Enterprise Only</span> | <span class="text-danger">N</span> | Y (for public repos) |
| WebSite Hosting | <span class="text-success">Y</span> | Y | <span class="text-danger">N</span> |
| SSI / CGI / mod_perl registry Support | <span class="text-success">Y</span> | <span class="text-danger">N</span> | <span class="text-danger">N</span> |
| Fine-Grained ACL on Source Repo | <span class="text-success">Enterprise Only</span> | <span class="text-danger">N</span> | <span class="text-danger">N</span> |
| +500 MB/s Full Site Builds | <span class="text-success">Y</span> | <span class="text-info">?</span> | <span class="text-danger">N</span> |
| 8-64 Way Concurrent Builds | <span class="text-success">Y</span> | Enterprise Only ($$) | <span class="text-danger">N</span> |
| TCO &lt; $5000/yr for Enterprise | <span class="text-success">Y</span> | <span class="text-danger">N</span> | <span class="text-info">?</span> |
| 99.99% SLA for Enterprise | Coming in Q4 | Y | <span class="text-danger">N</span> |
| Serverless Integration | Coming Soon! | Y | <span class="text-danger">N</span> |
| Choice of Programming Language | Coming Soon! | <span class="text-danger">N</span> | <span class="text-danger">N</span> |

<br />

### Consumer Information on SLA offers related to the JAM Stack that you may come across elsewhere...

Informed consumers should always **ask** which components of the JAM Stack are covered by SLA, or get written assurance that your SLA provides blanket coverage for the entire stack, *including the VCS, build infra, and CMS / IDE portions*.  You might be surprised by the answers: even GitHub has serious multi-hour outages from time to time, on which many competitors base their entire offerings.  Such services with nominal **99.99%** SLA's, which is less than an hour a year of total downtime, clearly have some explaining to do, if you are under the impression your full service stack is under SLA.  *It's not*, we're just being up front with you about it.

What we're offering instead, for 2020, is a best effort to keep our Subversion service online **24x7x365**, with primary focus on Continental US business hours, and with a competitive target of having our [SLI](https://en.wikipedia.org/wiki/Service_level_indicator)'s read favorably when compared to the rest of the market (including GitHub itself, whose SLA's revolve around response time targets, not the actual duration of downtime incidents).  SLA's are an important ingredient, so Enterprise customers will enjoy our comprehensive **99.99%**, which covers **everything** but the Subversion service itself.  Nobody offers blanket availability SLA contracts for their version control service infrastructure; and you should be wary of doing business with someone who does in today's marketplace.

### More on the Product...

It does all this by either interfacing with an [svnpubsub](https://svn.apache.org/repos/asf/subversion/trunk/tools/server-side/svnpubsub/)-enabled, customer hosted Subversion service, or by using one of ours.  It automatically builds each committed change using a lightning fast [`node.js`](https://nodejs.org/) + [`Perl 7`](https://www.perl.com/article/announcing-perl-7/) build system based on the [Hollywood Principle](https://deviq.com/hollywood-principle/): it calls out to customer-supplied Perl modules to do whatever the customer needs done (don't worry, there are basic layout templates available that will do all the heavy lifting for you).  It also goes the extra mile and instantly distributes the change-sets for the build, atomically, to your live website servers / CDN providers.

[REST compliance](https://www.codecademy.com/articles/what-is-rest) has its benefits to CMS users.  They'll like the fact that their browser's <span class="text-white">Back</span> button doesn't break the service; in fact it's an essential component of the <span class="text-white">Rollback</span> functionality. In an emergency site breakage situation, going back to the bad <span class="text-white">Commit</span> submission's result page will provide them with the ability to reverse merge <span class="text-white">that</span> errant applied change &mdash; at the click of a button &mdash; and rebuild the site back to a known good state.

We currently provide a basic <span class="text-white">Django</span> based template system derived from a customized [`Dotiac::DTL`](http://dotiac.sourceforge.net/cgi-bin/index.pl) module from CPAN.  Support for a Python 3 build system is coming in 2020 Q4 (other languages will follow in 2021). The Apache 2.0 Licensed [CMS build system](https://github.com/SunStarSys/cms), together with a large collection of supporting modules to take advantage of within that tree, is available on GitHub.


### Details

{% endfilter %}

{{ content|markdown }}
<hr />
<br />
<h2>A Few Representative Screen Shots:</h2>
<br />
<h3><a href="https://cms.sunstarsys.com/redirect?uri=https://www.openoffice.org/">IDE View</a> with Farsi (UTF-8).</h3>
<center><img src="../images/ide-fa.png" style="width:800px"></center>
<br/>
<h3>IDE Editor View.</h3>
<center><img src="../images/ide-editor.png" style="width:800px"></center>
<br/>
<h3>IDE Editor View (Spanish).</h3>
<center><img src="../images/ide-es.png" style="width:800px"></center>
<br/>
<h3>IDE Full Site Build.</h3>
<center><img src="../images/ide-build.png" style="width:800px"></center>
<br />
<h3>IDE Typical Site Build.</h3>
<center><img src="../images/ide-file-build.png" style="width:800px"></center>
<br />
<h3><a href="https://cms.sunstarsys.com/redirect?uri=https://www.openoffice.org/;action=search;regex=mailto:">IDE Search</a> <small>(those links in <span style="color:#e83e8c">hot pink</span> will drop you directly into an editor screen, with the cursor placed exactly according to the matching text)</small>.</h3>
<center><img src="../images/ide-search.png" style="width:800px"></center>
</div>
{% endblock %}
