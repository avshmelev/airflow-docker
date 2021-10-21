# airflow-experiment

# Dockerfile и docker-compose взял из 7-го урока, поменял лишь версии AIRFLOW_VERSION=2.1.4 и SQLAlchemy==1.3.24
# Ошибок нет, PG поднимается, шедулер запускается, но пользователь не создаётся, всегда появляется предупреждение:
#{{manager.py:798}} WARNING - No user yet created, use flask fab command to do it.
# В airflow.cfg проставил флаг rbac = True, как советовали в комментариях. Не помогло.

#run
docker-compose up --build
