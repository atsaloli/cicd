all: lab-pipeline.png lab-pipeline-full-auto.png ssh-trust-stage.png deploy-git.png build-test-deploy.png

lab-pipeline.png: lab-pipeline.dot
	dot -Tpng -o $@ $<

lab-pipeline-full-auto.png: lab-pipeline-full-auto.dot
	dot -Tpng -o $@ $<

ssh-trust-stage.png: ssh-trust-stage.dot
	dot -Tpng -o $@ $<

deploy-git.png: deploy-git.dot
	dot -Tpng -o $@ $<

build-test-deploy.png: build-test-deploy.dot
	dot -Tpng -o $@ $<

clean:
	$(RM) lab-pipeline.png lab-pipeline-full-auto.png ssh-trust-stage.png deploy-git.png build-test-deploy.png
