package test;

import internal.Utf8ExtInternalEthalon;
import org.zamedev.lib.internal.Utf8ExtInternal;
import utest.Assert;
import utest.Test;

class CaseMapsGeneratorTest extends Test {
    public function testUpperToLowerMapping() : Void {
        var ethalonMap = new Map<Int, Int>();
        var testMap = new Map<Int, Int>();

        Utf8ExtInternalEthalon.fillUpperToLowerMap(ethalonMap);
        Utf8ExtInternal.fillUpperToLowerMap(testMap);

        for (key in ethalonMap.keys()) {
            Assert.isTrue(testMap.exists(key));
            Assert.equals(ethalonMap[key], testMap[key]);
        }

        for (key in testMap.keys()) {
            Assert.isTrue(ethalonMap.exists(key));
        }
    }

    public function testLowerToUpperMapping() : Void {
        var ethalonMap = new Map<Int, Int>();
        var testMap = new Map<Int, Int>();

        Utf8ExtInternalEthalon.fillLowerToUpperMap(ethalonMap);
        Utf8ExtInternal.fillLowerToUpperMap(testMap);

        for (key in ethalonMap.keys()) {
            Assert.isTrue(testMap.exists(key));
            Assert.equals(ethalonMap[key], testMap[key]);
        }

        for (key in testMap.keys()) {
            Assert.isTrue(ethalonMap.exists(key));
        }
    }
}
