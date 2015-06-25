# Chameleon Cloud Docker Tutorial

This repo is contains the files for the Chameleon Cloud Docker tutorial. You can find all the Chameleon tutorials [here](https://cloudandbigdatalab.github.io). In this tutorial we're going to guide you through the fundamentals of using Docker on Chameleon Cloud. You should already be familiar with managing resources on Chameleon Cloud, if not follow the "Getting Started" tutorial. At the end of this tutorial you will have setup a demo website utilizing 5 Docker containers and 2 physical hosts.

## Prerequisites

It's expected that you have a general knowledge of Linux command-line environments, though most of the steps can be copied exactly without modification. No previous knowledge of Docker is required but this tutorial will not explain Docker concepts, only how to implement. See the official Docker [docs](https://docs.docker.com/) for explanation of the concepts used in this tutorial.

## Steps Outline

1. Spin up Chameleon resources
2. Setup containers
  - Postgres and ambassador containers on host 1
  - Nginx, uWSGI (Python), and ambassador containers on host 2
4. Test demo site to see if configuration was successful

## 1. Chameleon Resources

Create 2 Chameleon baremetal servers. We used a CentOS 7 image for this tutorial but feel free to use any other Distro as long it runs Docker. Install Docker on each server. `sudo yum install docker` You may wish to also install an editor such as vim and git (if not already installed).

## 2. Container Setup

Before you move on let's explain some things. You will be setting up one host with a Postgres (SQL database) container. The other host will be setup with Nginx (web server) and uWGSI (interface to Python script that generates actual page) containers. To connect the uWGSI container across hosts to the Postgres container we will use*ambassador* containers, one on each host.

### Host 1
