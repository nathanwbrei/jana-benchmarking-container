# jana-benchmarking-container

This container is designed to run JANA's built-in JTest benchmarker in an easy and consistent way. 

To run the benchmark, do this:

```bash
docker pull nbrei/jana2-benchmarking
docker run -it --mount type=bind,source=`pwd`,target=/app/data nbrei/jana2-benchmarking
```

Note that you need to bind-mount some directory on your host machine to `\app\data` inside the container. This is so that you can retrieve the CSV files generated by the benchmarker. In the example above, I just bind to the current working directory, though you may want to bind it somewhere else.
 
The benchmarking script generates a scaling curve for 1..n threads, where n is the max number of cores detected on the machine. Note: Docker might be configured to see only some of the cores available (this is definitely the case on macOS).

The benchmarking script generates scaling curves for 3 different affinity strategies and 4 different locality strategies. Correspondingly, the results data is written to directories named

`\app\data\a0l0\, \app\data\a0l1\, ...`. 

 
Within each directory is a `rates.csv` file which gives the average and RMS throughput for each number of threads. This is your scalability curve for that particular choice of affinity and locality strategy. There is also a `samples.csv` file which contains the raw data, which you probably won't need. Finally, there is a `jana-plot-scaletest.py` which converts the `rates.csv` file into a Matplotlib graphic.


