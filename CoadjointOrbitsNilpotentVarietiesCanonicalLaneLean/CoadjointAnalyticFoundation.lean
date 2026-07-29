import CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean.OrbitClosureRelations

/-!
# Coadjoint Analytic Foundation
-/

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean

structure CoadjointAnalyticFoundation where
  orbitStructure : CoadjointOrbitStructure
  orbitEvidence : CoadjointOrbitEvidence orbitStructure
  nilpotentVariety : NilpotentVarietyClassification orbitStructure
  nilpotentEvidence : NilpotentVarietyEvidence orbitStructure nilpotentVariety
  orbitClosure : OrbitClosureRelations orbitStructure nilpotentVariety
  orbitClosureEvidence : OrbitClosureEvidence orbitStructure nilpotentVariety orbitClosure

def CoadjointAnalyticFoundationClosed (A : CoadjointAnalyticFoundation) : Prop :=
  CoadjointOrbitClosed A.orbitStructure ∧
  NilpotentVarietyClosed A.orbitStructure A.nilpotentVariety ∧
  OrbitClosureRelationsClosed A.orbitStructure A.nilpotentVariety A.orbitClosure

theorem coadjoint_analytic_foundation_closed_from_evidence (A : CoadjointAnalyticFoundation) :
    CoadjointAnalyticFoundationClosed A := by
  exact And.intro (coadjoint_orbit_closed_from_evidence A.orbitStructure A.orbitEvidence)
    (And.intro (nilpotent_variety_closed_from_evidence A.orbitStructure A.nilpotentVariety A.nilpotentEvidence)
      (orbit_closure_relations_closed_from_evidence A.orbitStructure A.nilpotentVariety A.orbitClosure A.orbitClosureEvidence))

end CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean
end HautevilleHouse
