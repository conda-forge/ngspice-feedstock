About ngspice-suite-feedstock
=============================

Feedstock license: [BSD-3-Clause](https://github.com/conda-forge/ngspice-feedstock/blob/main/LICENSE.txt)

Home: http://ngspice.sourceforge.net

Package license: BSD-3-Clause

Summary: The open source spice simulator for electric and electronic circuits

Development: http://ngspice.sourceforge.net/devel.html

Documentation: http://ngspice.sourceforge.net/docs.html

ngspice is the open source spice simulator for electric and electronic circuits.

Such a circuit may comprise of JFETs, bipolar and MOS transistors, passive elements
like R, L, or C, diodes, transmission lines and other devices, all interconnected
in a netlist. Digital circuits are simulated as well, event driven and fast, from
single gates to complex circuits. And you may enter the combination of both analog
and digital as a mixed-signal circuit.

ngspice offers a wealth of device models for active, passive, analog, and digital
elements. Model parameters are provided by the semiconductor manufacturers.
The user add her circuits as a netlist, and the output is one or more graphs of
currents, voltages and other electrical quantities or is saved in a data file.

Note:
  This build was configured with `--enable-xspice --enable-cider --enable=openmp`
  See the [build script](https://git.io/JfVZX) for more specifics.


Current build status
====================


<table>
    
  <tr>
    <td>Azure</td>
    <td>
      <details>
        <summary>
          <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=9256&branchName=main">
            <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/ngspice-feedstock?branchName=main">
          </a>
        </summary>
        <table>
          <thead><tr><th>Variant</th><th>Status</th></tr></thead>
          <tbody><tr>
              <td>linux_64</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=9256&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/ngspice-feedstock?branchName=main&jobName=linux&configuration=linux%20linux_64_" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_64</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=9256&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/ngspice-feedstock?branchName=main&jobName=osx&configuration=osx%20osx_64_" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_arm64</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=9256&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/ngspice-feedstock?branchName=main&jobName=osx&configuration=osx%20osx_arm64_" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>win_64</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=9256&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/ngspice-feedstock?branchName=main&jobName=win&configuration=win%20win_64_" alt="variant">
                </a>
              </td>
            </tr>
          </tbody>
        </table>
      </details>
    </td>
  </tr>
</table>

Current release info
====================

| Name | Downloads | Version | Platforms |
| --- | --- | --- | --- |
| [![Conda Recipe](https://img.shields.io/badge/recipe-ngspice-green.svg)](https://anaconda.org/conda-forge/ngspice) | [![Conda Downloads](https://img.shields.io/conda/dn/conda-forge/ngspice.svg)](https://anaconda.org/conda-forge/ngspice) | [![Conda Version](https://img.shields.io/conda/vn/conda-forge/ngspice.svg)](https://anaconda.org/conda-forge/ngspice) | [![Conda Platforms](https://img.shields.io/conda/pn/conda-forge/ngspice.svg)](https://anaconda.org/conda-forge/ngspice) |
| [![Conda Recipe](https://img.shields.io/badge/recipe-ngspice--exe-green.svg)](https://anaconda.org/conda-forge/ngspice-exe) | [![Conda Downloads](https://img.shields.io/conda/dn/conda-forge/ngspice-exe.svg)](https://anaconda.org/conda-forge/ngspice-exe) | [![Conda Version](https://img.shields.io/conda/vn/conda-forge/ngspice-exe.svg)](https://anaconda.org/conda-forge/ngspice-exe) | [![Conda Platforms](https://img.shields.io/conda/pn/conda-forge/ngspice-exe.svg)](https://anaconda.org/conda-forge/ngspice-exe) |
| [![Conda Recipe](https://img.shields.io/badge/recipe-ngspice--lib-green.svg)](https://anaconda.org/conda-forge/ngspice-lib) | [![Conda Downloads](https://img.shields.io/conda/dn/conda-forge/ngspice-lib.svg)](https://anaconda.org/conda-forge/ngspice-lib) | [![Conda Version](https://img.shields.io/conda/vn/conda-forge/ngspice-lib.svg)](https://anaconda.org/conda-forge/ngspice-lib) | [![Conda Platforms](https://img.shields.io/conda/pn/conda-forge/ngspice-lib.svg)](https://anaconda.org/conda-forge/ngspice-lib) |

Installing ngspice-suite
========================

Installing `ngspice-suite` from the `conda-forge` channel can be achieved by adding `conda-forge` to your channels with:

```
conda config --add channels conda-forge
conda config --set channel_priority strict
```

Once the `conda-forge` channel has been enabled, `ngspice, ngspice-exe, ngspice-lib` can be installed with `conda`:

```
conda install ngspice ngspice-exe ngspice-lib
```

or with `mamba`:

```
mamba install ngspice ngspice-exe ngspice-lib
```

It is possible to list all of the versions of `ngspice` available on your platform with `conda`:

```
conda search ngspice --channel conda-forge
```

or with `mamba`:

```
mamba search ngspice --channel conda-forge
```

Alternatively, `mamba repoquery` may provide more information:

```
# Search all versions available on your platform:
mamba repoquery search ngspice --channel conda-forge

# List packages depending on `ngspice`:
mamba repoquery whoneeds ngspice --channel conda-forge

# List dependencies of `ngspice`:
mamba repoquery depends ngspice --channel conda-forge
```


About conda-forge
=================

[![Powered by
NumFOCUS](https://img.shields.io/badge/powered%20by-NumFOCUS-orange.svg?style=flat&colorA=E1523D&colorB=007D8A)](https://numfocus.org)

conda-forge is a community-led conda channel of installable packages.
In order to provide high-quality builds, the process has been automated into the
conda-forge GitHub organization. The conda-forge organization contains one repository
for each of the installable packages. Such a repository is known as a *feedstock*.

A feedstock is made up of a conda recipe (the instructions on what and how to build
the package) and the necessary configurations for automatic building using freely
available continuous integration services. Thanks to the awesome service provided by
[Azure](https://azure.microsoft.com/en-us/services/devops/), [GitHub](https://github.com/),
[CircleCI](https://circleci.com/), [AppVeyor](https://www.appveyor.com/),
[Drone](https://cloud.drone.io/welcome), and [TravisCI](https://travis-ci.com/)
it is possible to build and upload installable packages to the
[conda-forge](https://anaconda.org/conda-forge) [anaconda.org](https://anaconda.org/)
channel for Linux, Windows and OSX respectively.

To manage the continuous integration and simplify feedstock maintenance
[conda-smithy](https://github.com/conda-forge/conda-smithy) has been developed.
Using the ``conda-forge.yml`` within this repository, it is possible to re-render all of
this feedstock's supporting files (e.g. the CI configuration files) with ``conda smithy rerender``.

For more information please check the [conda-forge documentation](https://conda-forge.org/docs/).

Terminology
===========

**feedstock** - the conda recipe (raw material), supporting scripts and CI configuration.

**conda-smithy** - the tool which helps orchestrate the feedstock.
                   Its primary use is in the construction of the CI ``.yml`` files
                   and simplify the management of *many* feedstocks.

**conda-forge** - the place where the feedstock and smithy live and work to
                  produce the finished article (built conda distributions)


Updating ngspice-suite-feedstock
================================

If you would like to improve the ngspice-suite recipe or build a new
package version, please fork this repository and submit a PR. Upon submission,
your changes will be run on the appropriate platforms to give the reviewer an
opportunity to confirm that the changes result in a successful build. Once
merged, the recipe will be re-built and uploaded automatically to the
`conda-forge` channel, whereupon the built conda packages will be available for
everybody to install and use from the `conda-forge` channel.
Note that all branches in the conda-forge/ngspice-suite-feedstock are
immediately built and any created packages are uploaded, so PRs should be based
on branches in forks and branches in the main repository should only be used to
build distinct package versions.

In order to produce a uniquely identifiable distribution:
 * If the version of a package **is not** being increased, please add or increase
   the [``build/number``](https://docs.conda.io/projects/conda-build/en/latest/resources/define-metadata.html#build-number-and-string).
 * If the version of a package **is** being increased, please remember to return
   the [``build/number``](https://docs.conda.io/projects/conda-build/en/latest/resources/define-metadata.html#build-number-and-string)
   back to 0.

Feedstock Maintainers
=====================

* [@stuarteberg](https://github.com/stuarteberg/)

