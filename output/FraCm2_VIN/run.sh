#!/bin/bash
                #SBATCH -D '/dataweb/app/development/nbdsuite_gui/database_users_folder/mmunicoy/ifr/FraCm2_VIN'
                #SBATCH -J nbdweb
                #SBATCH --output=nbdweb%j.out
                #SBATCH --error=nbdweb%j.out
                #SBATCH --ntasks=16
                #SBATCH --mem-per-cpu=1000
                #SBATCH --nodes=1
                #SBATCH --time=01:00:00

                . /etc/bashrc

                ## NBD Suite
                ml PELE/1.8b4
                ml rDock/2022_v0
                ml Miniconda3/4.12.0

                source activate /shared/software/conda/nbdsuite-latest

                export GYPSUMDL_ROOT=/shared/software/containers/gypsum_dl.sif
                export SCHRODINGER="/shared/software/standalone/schrodinger2023-1/"

                python -u -m nbdsuite.main input.yaml

                # Check if the results folder exists, if not, exit with error
                if [ ! -d ./*/*_adaptive_pele_simulation/*/results ]; then
                    echo "
ERROR: Job failed. Are the protein and ligand correctly prepared?"
                    exit 1
                else
                    echo "Job finished successfully"
                fi
                