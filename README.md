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

Create 2 Chameleon baremetal servers. We used a CentOS 7 image for this tutorial but feel free to use any other Distro as long it runs Docker. Install Docker on each server. `sudo yum install docker` You may also wish to install an editor such as vim and git (if not already installed).  

**Important**  
The Docker daemon needs to be running before you can use Docker. Start it with `sudo service docker start`. If you're getting errors with every Docker command this may be the cause.

## 2. Container Setup

Before you move on let's explain some things. You will be setting up one host with a Postgres (SQL database) container. The other host will be setup with Nginx (web server) and uWGSI (interface to Python script that generates actual page) containers. To connect the uWGSI container across hosts to the Postgres container we will use *ambassador* containers, one on each host.  

**Note**  
You have two options to deploy the containers. You can pull already built containers from our [Docker Hub](https://hub.docker.com/u/cloudandbigdatalab/) repos and run them. Or you can pull this GitHub repo and build the Docker images yourself using the Dockerfile in each directory. If you want to edit the site content you will need to build the images yourself after making your edits, although you can edit the database by simply connecting to it. The ambassador containers we're using are maintained by a Docker employee and thus we'll only be pulling those. You can pull an image before running it with `sudo docker pull image_name` or you can  just `sudo docker run --name container_name -d image_name` and Docker will automatically pull the image for you.

### Host 1

#### Pulling from Docker Hub
```sh
# start postgres container
# port 3031 is set to be exposed in Dockerfile
# -d run as daemon (run in background)
# user: cloudandbigdatalab, repo: postgres
sudo docker run --name postgres -d cloudandbigdatalab/postgres

# start ambassador container, linking to postgres,
# -p map port 3031 from within container to outside
sudo docker run --name host2_ambassador -d --link postgres:postgres -p 3031:3031 svendowideit/ambassador
```

#### Building from GitHub
```sh
# clone repo
git clone https://github.com/cloudandbigdatalab/chameleon-docker-tutorial.git

# move into postgres directory
cd postgres

# build postgres image
# -t to name
# . is path to Dockerfile
sudo docker build -t postgres .

# from here you run the same commands from the pulling section
# except change cloudandbigdatalab/postgres to postgres in run command
```
