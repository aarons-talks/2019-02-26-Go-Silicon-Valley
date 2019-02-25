# Building [Hugo](https://gohugo.io) with Go Modules and Athens :tada:

Hey Gophers! We're gonna build [Hugo](https://gohugo.io) with [Go Modules](https://github.com/golang/go/wiki/Modules) and [Athens](https://docs.gomods.io). I gave this demo at my [Go Silicon Valley talk](https://www.meetup.com/Go-Silicon-Valley/events/255923171/) about Go Modules and Athens.

# Run The Demo

Below is how how to do the demo yourself. The instructions are for Linux/Mac OS X systems.

## Check out Hugo Locally

You can do this anywhere on your system:

```
$ git clone https://github.com/gohugoio/hugo.git && cd hugo
```

## Point to the Public Athens

This will make `go` talk to Athens for all its dependencies, not directly to the VCS:

```console
$ export GOPROXY=https://athens.azurefd.net
```

## Clear Local Module Cache

This will force `go` to ask Athens for all the dependencies. You have to run this with `sudo` because the Go toolchain restricts modules to read-only. It tries to keep dependencies immutable too :smile:.

```console
$ sudo rm -r $GOPATH/pkg/mod
```

## Build the Binary!

No need to change your familiar tools to do this:

```console
$ go build .
```

## Test Things Out

Just to make sure things worked properly:

```console
$ ls -al ./hugo
$ ./hugo version
```

## Where to Go from Here

You can use Athens for any project that uses Go modules. Just set GOPROXY to https://athens.azurefd.net in your environment.

But remember, that URL is an experimental Athens server for now. _I recommand that you don't rely on it for production code yet_.

### Another Adventure... Run Your Own Athens!

If you'd rather not rely on the public Athens (it _is_ experimental after all!), then run your own!

The easiest way to do that - and the way I recommend - is using Docker. Run this to start up Athens:

```console
$ docker run -p 3000:3000 gomods/athens:v0.2.0
```

And then to set your environment variable to point to the local server:

```console
$ export GOPROXY=http://localhost:3000
```

From here, go back and clear your cache and build Hugo again. Magic!!!

### Finally

If you want to learn more, check out https://docs.gomods.io! **And** we'd love for you to get involved! Here are some ways to do so:

- Come star our repo and get involved: github.com/gomods/athens 
- Come say hi on the `#athens` channel in the [Gophers Slack](https://invite.slack.golangbridge.org/)
- Come to one of our [developer meetings](https://docs.gomods.io/contributing/community/developer-meetings/). Absolutely everybody is welcome, regardless of experience, background or anything else.

# Keep on rockin', Gophers!
