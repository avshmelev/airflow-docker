#!/bin/bash

sleep 10
#airflow upgradedb
airflow db init
sleep 10

airflow users create \
          --username testuser \
          --firstname testuser \
          --lastname testuser \
          --role Admin \
          --email takad16604@decorbuz.com \
          - p testuser

airflow scheduler & airflow webserver
