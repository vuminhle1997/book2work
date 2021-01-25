#!/bin/bash

function stop() {
    echo 'Stopping all services'

    aws ecs update-service --cluster book2work --service book2work_users --desired-count 0 | grep 'serviceName'
    aws ecs update-service --cluster book2work --service book2work_frontend --desired-count 0 | grep 'serviceName'
    aws ecs update-service --cluster book2work --service book2work_go_bookings --desired-count 0 | grep 'serviceName'
    aws ecs update-service --cluster book2work --service book2work_rooms --desired-count 0 | grep 'serviceName'
    aws ecs update-service --cluster book2work --service book2workBookings --desired-count 0 | grep 'serviceName'

    return 0
}

if stop; then
    echo 'Stopped all services . . .'
else
    echo 'Failed . . .'
fi