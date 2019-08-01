Dockerized AWS CLI
==================

An AWS CLI docker image, with support for running as the current uid/gid.

Installation
------------
Add the following alias to your .bashrc
```
alias aws='docker run -i --rm -v $HOME/.aws:/home/aws/.aws:ro -v $(pwd):/project -u "$(id -u):$(id -g)" bgahagan/docker-aws-cli'
```

Example
-----
`aws s3 cp s3://aft-vbi-pds/bin-images/523.jpg .`

Notes
-----
* If you're referencing files using paths, they should be relative to the current working directory.
The current working directory is mounted at /project in the contianer.
