CBU=COBOLUnitLib
CBU_TESTS=COBOLUnitTests

all:
	$(MAKE) -C $(CBU)
	$(MAKE) -C $(CBU_TESTS)

clean:
	$(MAKE) -C $(CBU) clean
	$(MAKE) -C $(CBU_TESTS) clean

