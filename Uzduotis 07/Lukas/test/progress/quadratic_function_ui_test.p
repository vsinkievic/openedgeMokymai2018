 
 /*------------------------------------------------------------------------
    File        : quadratic_function_ui_test.p 
    Syntax      : 
    Author(s)   : Studentas
    Created     : Wed Jul 04 00:59:35 EEST 2018
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING OpenEdge.Core.Assert FROM PROPATH.

BLOCK-LEVEL ON ERROR UNDO, THROW. 

define variable dA as decimal no-undo.
define variable dB as decimal no-undo.
define variable dC as decimal no-undo.
define variable x1 as decimal no-undo.
define variable x2 as decimal no-undo.
define variable equationSolved as log no-undo.

{quadratic_function_solution.i}

@Test.
procedure whenProcedureIsRun_thenTestIsPassed:
    //given

    //when
    run quadratic_function_ui.p.

    //then
end procedure.

@Test.
procedure givenCoefficientsForPositiveDiscr_whenSolutionFunctionIsApplied_thenTwoCorrectRootsAreReceived_V1:
    //given
    dA = 1.
    dB = 4.
    dC = 0.
    
    //when
    equationSolved = quadEqSolution(dA, dB, dC, output x1, output x2).
    
    //then
    Assert:EQUALS(0, x1).
    Assert:EQUALS(-4, x2).
    Assert:ISTRUE(equationSolved).
end procedure.

@Test.
procedure givenCoefficientsForPositiveDiscr_whenSolutionFunctionIsApplied_thenTwoCorrectRootsAreReceived_V2:
    //given
    dA = 2.
    dB = -5.
    dC = 3.
    
    //when
    equationSolved = quadEqSolution(dA, dB, dC, output x1, output x2).
    
    //then
    Assert:EQUALS(1.5, x1).
    Assert:EQUALS(1, x2).
    Assert:ISTRUE(equationSolved).
end procedure.