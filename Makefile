CBU=COBOLUnitLib
CBU_TESTS=COBOLUnitTests
CBU_SAMPLES=COBOLUnitSamples

all:
	$(MAKE) -C $(CBU)
	$(MAKE) -C $(CBU_TESTS)
	$(MAKE) -C $(CBU_SAMPLES)

clean:
	$(MAKE) -C $(CBU) clean
	$(MAKE) -C $(CBU_TESTS) clean
	$(MAKE) -C $(CBU_SAMPLES) clean
