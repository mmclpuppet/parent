# Working with shared-common-docs

[![Build Status](https://travis-ci.com/puppetlabs/shared-common-docs.svg?token=7XPVJxYqyVbCPcRZYjcV&branch=master)](https://travis-ci.com/puppetlabs/shared-common-docs)

This repo houses the Technical Publications team's shared documentation assets. We share the files in this repo into our other docs repos as a subtree.

## Updating shared docs repos

Once you merge in a change to this repo, a Travis CI build runs
and automatically pulls the changes into dependent repos.

> **Note**: The Travis-CI job relies on the the puppet-travis user
> having write access to the dependant docs repo.

## Using the merge toolset locally

Before you use the toolset locally:
- Clone this repo and `cd` into `shared-common-docs`.
- Make sure you've installed Ruby on your machine. The build uses 
  version 2.5.1. You can check your current Ruby versions with `ruby --version`.

For a list of available tasks and descriptions, run 
`rake -T`.

If you need to, you can run the build manually on your machine
using the following command:

```ruby
rake merge
```

> **Note:** Running the merge task will copy a bunch of directories onto your machine.
> Once you're done, use `rake clobber` to get rid of the directories.

To list all repos that use shared-docs:

```ruby
rake list
```
