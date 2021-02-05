# Installation

```bash
docker pull xjulia/env:latest
```

# Environment

* `Miniconda 3`
* `julia 1.5.3`

# Pluto.jl

In CMD or bash:

```bash
docker run -it --rm -p 8888:8888 -v /c/Github:/home xjulia/env:latest
# or
docker run --rm -it -d -p 8888:8888 -v path/to/folder:/notebooks xjulia/env:latest
```

In container:

```bash
shell>julia
julia>using Pluto
julia>Pluto.run("0.0.0.0", 8888; configuration=Pluto.ServerConfiguration(launch_browser=false))
```

In host:

[http://localhost:8888/](http://localhost:8888/)

# Jupyter 

In CMD or bash:

```bash
docker run -it --rm -p 8888:8888 -v /c/Github:/home xjulia/env:latest
```

In container:

```bash
jupyter notebook --no-browser --ip=0.0.0.0 --allow-root --NotebookApp.token= --notebook-dir='/home'
# or
jupyter lab --no-browser --ip=0.0.0.0 --allow-root --NotebookApp.token= --notebook-dir='/home'
```

In host:

[http://localhost:8888/](http://localhost:8888/)