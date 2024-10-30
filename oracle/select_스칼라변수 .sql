VARIABLE pName VARCHAR2;
VARIABLE pKor NUMBER;
VARIABLE pEng NUMBER;
VARIABLE pMath NUMBER;
EXECUTE studentDetailData(2,:pName,:pKor,:pEng,:pMath);
PRINT pName;
PRINT pKor;
PRINT pEng;
PRINT pMath;
    --스칼라변수