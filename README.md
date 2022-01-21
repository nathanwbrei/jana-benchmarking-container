# jana-benchmarking-container

This container is designed to run JANA's built-in JTest benchmarker in an easy and consistent way. 

To run, do something like:

```bash
docker pull nbrei/jana2-benchmarking
docker run -it --mount type=bind,source=`pwd`,target=/app/data nbrei/jana2-benchmarking
```

