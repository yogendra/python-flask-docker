FROM python:3.6 as base
LABEL maintainer="lorenz.vanthillo@gmail.com"

RUN mkdir /app && \
  chown nobody /app
WORKDIR /app
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
USER nobody


FROM base
COPY . .
WORKDIR /app
EXPOSE 8080
ENTRYPOINT ["python"]
CMD ["app/app.py"]
