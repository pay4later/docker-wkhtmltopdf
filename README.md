# pay4later/docker-wkhtmltopdf

A docker container to run wkhtmltopdf including Microsoft's True Type core fonts.

## Building the image

```sh
docker build . -t pay4later/docker-wkhtmltopdf
```

## Running the image

```sh
docker run -v $PWD:/mnt pay4later/docker-wkhtmltopdf google.com /mnt/out.pdf
```
