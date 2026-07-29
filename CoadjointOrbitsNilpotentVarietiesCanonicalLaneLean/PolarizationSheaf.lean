import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarieties

structure PolarizationSheafPackage where
  nilpotentOrbit : Type u
  polarizationSubalgebra : Type v
  sheafOnOrbit : Type w
  constructibilityCondition : Prop
  intersectionCohomologyComputation : Prop
  LEPurityStatement : Prop
  characteristicCycleFormula : Prop

structure PolarizationSheafEvidence (P : PolarizationSheafPackage) where
  constructibilityConditionClosed : P.constructibilityCondition
  intersectionCohomologyComputationClosed : P.intersectionCohomologyComputation
  LEPurityStatementClosed : P.LEPurityStatement
  characteristicCycleFormulaClosed : P.characteristicCycleFormula

def PolarizationSheafClosed (P : PolarizationSheafPackage) : Prop :=
  P.constructibilityCondition ∧ P.intersectionCohomologyComputation ∧
  P.LEPurityStatement ∧ P.characteristicCycleFormula

theorem polarization_sheaf_closed_from_evidence (P : PolarizationSheafPackage) (E : PolarizationSheafEvidence P) :
    PolarizationSheafClosed P := by
  exact And.intro E.constructibilityConditionClosed
    (And.intro E.intersectionCohomologyComputationClosed
      (And.intro E.LEPurityStatementClosed E.characteristicCycleFormulaClosed))

end CoadjointOrbitsNilpotentVarieties
end HautevilleHouse
