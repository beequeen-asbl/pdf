DAT = $(shell date +%Y-%m-%d-%H%M)
TGT = $(shell basename ${PWD})

help:
	@echo "Usage:"
	@echo "   make bu"
	@echo "   make deploy"

bu:
	tar -cvJf /mnt/DATA/BeeQueen/BACKUPS/BQ_$(TGT)_$(DAT).tar.xz \
	    --exclude $(TGT)/.git/objects \
	    --exclude $(TGT)/.git/logs \
	    ../$(TGT)

deploy:
	git add *
	git commit -m "màj $(DAT)"
	git push
