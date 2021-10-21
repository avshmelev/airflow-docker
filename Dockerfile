# Возьмем за основу образ 
FROM python:3.7

# Airflow глобальные переменные
ARG AIRFLOW_VERSION=2.1.4
#ARG AIRFLOW_VERSION=1.10.14
ARG AIRFLOW_USER_HOME=/usr/local/airflow
ENV AIRFLOW_HOME=${AIRFLOW_USER_HOME}

#RUN pip install apache-airflow[postgres]==${AIRFLOW_VERSION}
#RUN pip install SQLAlchemy==1.3.23
COPY requirements.txt .
RUN pip install -r requirements.txt

# Создаем директрию для скриптов
RUN mkdir /project

# Копируем скрипты и конфиг файл
COPY scripts/ /project/scripts/
COPY config/airflow.cfg ${AIRFLOW_HOME}/airflow.cfg

# Доступы для скрипта
RUN chmod +x /project/scripts/init.sh

# Запускаем sh скрипт
ENTRYPOINT ["/project/scripts/init.sh"]