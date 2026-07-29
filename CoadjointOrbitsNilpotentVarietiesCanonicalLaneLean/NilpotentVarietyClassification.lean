import CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean.CoadjointOrbitStructure

/-!
# Nilpotent Variety Classification Package
-/

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean

structure NilpotentVarietyClassification (O : CoadjointOrbitStructure) where
  nilpotentCone : Type u
  nilpotentVariety : Type v
  jacobsonMorozov : Prop
  sheetDecomposition : Prop
  orbitalClosureOrder : Prop
  nilpotentConeClosed : O.lieAlgebraStructure → Prop
  nilpotentVarietyDefined : Prop
  jacobsonMorozovClosed : nilpotentVarietyDefined → jacobsonMorozov
  sheetDecompositionClosed : nilpotentVarietyDefined → sheetDecomposition
  orbitalClosureOrderClosed : nilpotentVarietyDefined → orbitalClosureOrder

structure NilpotentVarietyEvidence (O : CoadjointOrbitStructure) (N : NilpotentVarietyClassification O) where
  nilpotentConeClosed : N.nilpotentConeClosed (by exact O.lieAlgebraStructure)
  nilpotentVarietyDefinedClosed : N.nilpotentVarietyDefined
  jacobsonMorozovClosed : N.jacobsonMorozov
  sheetDecompositionClosed : N.sheetDecomposition
  orbitalClosureOrderClosed : N.orbitalClosureOrder

def NilpotentVarietyClosed (O : CoadjointOrbitStructure) (N : NilpotentVarietyClassification O) : Prop :=
  N.nilpotentConeClosed O.lieAlgebraStructure ∧ N.nilpotentVarietyDefined ∧ N.jacobsonMorozov ∧ N.sheetDecomposition ∧ N.orbitalClosureOrder

theorem nilpotent_variety_closed_from_evidence (O : CoadjointOrbitStructure) (N : NilpotentVarietyClassification O) (E : NilpotentVarietyEvidence O N) :
    NilpotentVarietyClosed O N := by
  exact And.intro E.nilpotentConeClosed
    (And.intro E.nilpotentVarietyDefinedClosed
      (And.intro E.jacobsonMorozovClosed
        (And.intro E.sheetDecompositionClosed E.orbitalClosureOrderClosed)))

end CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean
end HautevilleHouse
