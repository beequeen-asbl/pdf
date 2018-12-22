DAT = $(shell date +%Y-%m-%d-%H%M)
TGT = $(shell basename ${PWD})
BU_DIR = /mnt/DATA/BeeQueen/BACKUPS

help:
	@echo "Usage:"
	@echo "   make bu"
	@echo "   make deploy"

bu:
#	tar -cvJf $(BU_DIR)/BQ_$(TGT)_$(DAT).tar.xz \
#	    --exclude $(TGT)/.git/objects \
#	    --exclude $(TGT)/.git/logs \
#	    ../$(TGT)
	git archive --format=tar.gz -o $(BU_DIR)/BQ_$(TGT)_master_$(DAT).tar.gz master

deploy:
	git add *
	git commit -m "màj $(DAT)"
	git push
