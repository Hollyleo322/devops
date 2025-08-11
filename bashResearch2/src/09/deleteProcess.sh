#!/bin/bash

kill $(ps -fade | grep getHtml | awk '{print $2}')