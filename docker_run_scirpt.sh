#!/bin/bash

docker run -d -p 8001:8000 -v shares:/shares -v brent:/home/brent/notebooks -v dean:/home/dean/notebooks -v david:/home/david/notebooks --name jupyterhub jupyterhub
