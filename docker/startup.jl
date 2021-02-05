ENV["PYTHON"] = "python"
ENV["JUPYTER"] = "jupyter"
ENV["CONDA_JL_HOME"] = "/opt/conda/bin"
#ENV["CONDA_JL_HOME"] = "C://Apps//Anaconda"

atreplinit() do repl
    @async try
        sleep(0.1)
        @eval using Revise
        @async Revise.wait_steal_repl_backend()
    catch
        @warn("Could not load Revise.")
    end
end

atreplinit() do repl
    try
        @eval using OhMyREPL
    catch e
        @warn "error while importing OhMyREPL" e
    end
end