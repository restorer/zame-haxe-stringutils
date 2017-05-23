import massive.munit.TestSuite;

import CaseMapsGeneratorTest;
import Utf8ExtTest;

/**
 * Auto generated Test Suite for MassiveUnit.
 * Refer to munit command line tool for more information (haxelib run munit)
 */

class TestSuite extends massive.munit.TestSuite
{		

	public function new()
	{
		super();

		add(CaseMapsGeneratorTest);
		add(Utf8ExtTest);
	}
}
