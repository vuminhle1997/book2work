#!/bin/bash

function start() {
    echo 'Starting all services'
    aws ecs update-service --cluster book2work --service book2work_users --desired-count 1 | grep 'serviceName'
    aws ecs update-service --cluster book2work --service book2work_frontend --desired-count 1 | grep 'serviceName'
    aws ecs update-service --cluster book2work --service book2work_go_bookings --desired-count 1 | grep 'serviceName'
    aws ecs update-service --cluster book2work --service book2work_rooms --desired-count 1 | grep 'serviceName'
    aws ecs update-service --cluster book2work --service book2workBookings --desired-count 1 | grep 'serviceName'

    return 0
}

if start; then
    echo "Started all services . . ."
else 
    echo "Failed to start"
fi


