# AlumLand Gmod Server Docker Scripts

A collection of scripts for running a GMod server both locally and on AWS

## Running the server locally

```bash
$ docker-compose up
```

## Running the server on AWS

There are 3 CloudFormation scripts for running the GMod server.

### Download (`cloudformation_download.yml`)

This boostraps the AWS setup using a `t2.small` instance. This sets up the EBS volume mount with the gmod server files needed. The server can run on its own in the mode but the t2.small instance is perhaps overpowered for the job (and is not on the AWS free tier).
* The GMod server download requires 1GB of RAM

### Run (`cloudformation_run.yml`)

Used to bring up the gmod server after the EBS volume has been setup. Uses a `t2.micro` instance which can run on the free tier.

### Debug (`cloudformation_debug.yml`)

Used to debug issues with running the server. Debugging can be done by SSH'ing into the EC2 instance and then running

```bash
$ docker exec -it {CONTAINER_NAME} bash
```

Please note that `setup_gmod.sh` is not run in this debug stack!