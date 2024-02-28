FROM python:3.10-slim

ARG RESTACK_PRODUCT_VERSION=1.6.6

# All packages are hard-pinned to `dagster`, so setting the version on just `DAGSTER` will ensure
# compatible versions.
RUN pip install \
    dagster==${RESTACK_PRODUCT_VERSION} \
    dagster-postgres \
    dagster-aws \
    dagster-k8s \
    dagster-celery[flower,redis,kubernetes] \
    dagster-celery-k8s

# Get example pipelines

COPY example_project/ /
