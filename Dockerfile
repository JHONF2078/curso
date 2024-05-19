FROM condaforge/miniforge3:23.11.0-0
WORKDIR /app

RUN mkdir -p requirements

COPY environment.yml  ./requirements/

COPY app  ./

RUN if [ ! -d "/opt/conda/envs/data_analytics" ]; then \
    mamba init && mamba  env create -f ./requirements/environment.yml && \
    echo "mamba  activate data_analytics" >> ~/.bashrc; \
    fi

# Run app.py when the container launches
#CMD ["/bin/bash", "-c", "source activate data_analytics && python main.py"]
#CMD /bin/bash -c "source activate data_analytics && uvicorn main:app --host 0.0.0.0 --port 8000"