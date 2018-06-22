# UPTIME

Uptime is a fun little command line application you can use when you have some downtime. After you log in, you'll answer a few simple questions about where you are, and how much downtime you have. Uptime will then randomly suggest an activity from it's pool of activities that match that criteria. Some of the suggested activities are fun, or even a little silly. Some are closer to chores or other activities you probably should do, but might not otherwise be motivated to follow through with. Uptime may suggest that you clean your bathroom, or it may give you license to just chill and stream a movie on Netflix.

No matter what Uptime suggests, you can either accept or reject that suggested activity. Either way, Uptime will take notice and keep track of your overall acceptance rate, in addition to your acceptance rate for each suggestion. Uptime will sometimes suggest that you create a new suggestion to add to the pool, and then walk you through that process. You can also tell Uptime to no longer suggest any particular possibility. Thus, the more you use Uptime, the more you'll make it your own.

## Installation Instructions

Fork and clone this repository. From inside the main directory in the terminal, type "rake db:migrate" and then press enter. Then type "rake db:seed" and press enter. At this point, you should be ready to go! To run Uptime, type "ruby bin/run.rb" and press enter. Uptime will handle the rest.

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

You may want to contribute just to help a couple of beginning programmers out. Perhaps we haven't discovered a bug that you've found. Perhaps you actually want to use this program, but it's missing a feature you'd like. Whatever the reason, we appreciate your contributions.

## License

Copyright 2018 William Ley and Oren Magid

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute--but not sublicense or sell copies of the Software--and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
