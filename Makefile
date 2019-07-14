all:
	java -jar /usr/local/lib/antlr-4.7.2-complete.jar \
         -Dlanguage=Python2 \
         -no-listener \
         -visitor \
         CsvSchema.g4

test: all
	python run_tests.py

clean:
	rm -f *.interp *.tokens CsvSchema*.py *.pyc
