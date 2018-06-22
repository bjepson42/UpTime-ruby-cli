# UPTIME

Uptime is a fun little command line application you can use when you have some downtime. After you log in, you'll answer a few simple questions about where you are, and how much downtime you have. Uptime will then randomly suggest an activity from it's pool of activities that match that criteria. Some of the suggested activities are fun, or even a little silly. Some are closer to chores or other activities you probably should do, but might not otherwise be motivated to follow through with. Uptime may suggest that you clean your bathroom, or it may give you license to just chill and stream a movie on Netflix.

No matter what Uptime suggests, you can either accept or reject that suggested activity. Either way, Uptime will take notice and keep track of your overall acceptance rate, in addition to your acceptance rate for each suggestion. Uptime will sometimes suggest that you create a new suggestion to add to the pool, and then walk you through that process. You can also tell Uptime to no longer suggest any particular possibility. Thus, the more you use Uptime, the more you'll make it your own.

## Installation Instructions

Fork and clone this repository. From inside the main directory in the terminal, type "rake db:migrate" and then press enter. Then type "rake db:seed" and press enter. At this point, you should be ready to go! To run Uptime, type "ruby bin/run.rb" and press enter. Uptime will handle the rest.

## Contributor's Guide

### Our Pledge

In the interest of fostering an open and welcoming environment, we as
contributors and maintainers pledge to making participation in our project and
our community a harassment-free experience for everyone, regardless of age, body
size, disability, ethnicity, gender identity and expression, level of experience,
nationality, personal appearance, race, religion, or sexual identity and
orientation.

### Our Standards

Examples of behavior that contributes to creating a positive environment
include:

* Using welcoming and inclusive language
* Being respectful of differing viewpoints and experiences
* Gracefully accepting constructive criticism
* Focusing on what is best for the community
* Showing empathy towards other community members

Examples of unacceptable behavior by participants include:

* The use of sexualized language or imagery and unwelcome sexual attention or
advances
* Trolling, insulting/derogatory comments, and personal or political attacks
* Public or private harassment
* Publishing others' private information, such as a physical or electronic
  address, without explicit permission
* Other conduct which could reasonably be considered inappropriate in a
  professional setting

### Our Responsibilities

Project maintainers are responsible for clarifying the standards of acceptable
behavior and are expected to take appropriate and fair corrective action in
response to any instances of unacceptable behavior.

Project maintainers have the right and responsibility to remove, edit, or
reject comments, commits, code, wiki edits, issues, and other contributions
that are not aligned to this Code of Conduct, or to block temporarily or
permanently any contributor for other behaviors that they deem inappropriate,
threatening, offensive, or harmful.

### Scope

This Code of Conduct applies both within project spaces and in public spaces
when an individual is representing the project or its community. Examples of
representing a project or community include using an official project e-mail
address, posting via an official social media account, or acting as an appointed
representative at an online or offline event. Representation of a project may be
further defined and clarified by project maintainers.

### Enforcement

Instances of abusive, harassing, or otherwise unacceptable behavior may be
reported by contacting the project team associated with this GitHub account. All
complaints will be reviewed and investigated and will result in a response that
is deemed necessary and appropriate to the circumstances. The project team is
obligated to maintain confidentiality with regard to the reporter of an incident.
Further details of specific enforcement policies may be posted separately.

Project maintainers who do not follow or enforce the Code of Conduct in good
faith may face temporary or permanent repercussions as determined by other
members of the project's leadership.

To learn more about the process of how moderators enforce the Code of Conduct,
review the [Moderation Policy] and [Requesting Moderation].

[Moderation Policy]: https://github.com/nodejs/admin/blob/master/Moderation-Policy.md#moderation-policy
[Requesting Moderation]: https://github.com/nodejs/admin/blob/master/Moderation-Policy.md#requesting-moderation

### Attribution

This Code of Conduct is adapted from the Contributor Covenant Code of conduct, avaiable at [https://github.com/nodejs/admin/blob/master/CODE_OF_CONDUCT.md], which itself was adapted from [Contributor Covenant][homepage],
version 1.4, available at [http://contributor-covenant.org/version/1/4][version]

## Contributing to Uptime

We're excited that you're thinking about contributing to Uptime. If this is your first time contributing, please continue reading to learn how to make the most meaningful and useful impact possible.

### Raising an Issue to Encourage a Contribution

If you notice a problem with Uptime but you're unable to make the change
yourself, you should raise a Github issue containing a clear description of the
problem. Include relevant snippets of the content and/or screenshots if applicable.

### Submitting a Pull Request to Suggest an Improvement

If you see an opportunity for improvement and can make the change yourself go
ahead and use a typical git workflow to make it happen:

* Fork this repository
* Make the change on your fork, with descriptive commits in the standard format
* Open a Pull Request against this repo

We will review your change and approve or comment on it in due
course.

### Why Contribute?

Curriculum on Learn is publicly and freely available under Learn's
[Educational Content License](https://learn.co/content-license). By
embracing an open-source contribution model, our goal is for the curriculum
on Learn to become, in time, the best educational content the world has
ever seen.

We need help from the community of Learners to maintain and improve the
educational content. Everything from fixing typos, to correcting
out-dated information, to improving exposition, to adding better examples,
to fixing tests—all contributions to making the curriculum more effective are
welcome.

## License

Copyright 2018 William Ley and Oren Magid

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute--but not sublicense or sell copies of the Software--and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
