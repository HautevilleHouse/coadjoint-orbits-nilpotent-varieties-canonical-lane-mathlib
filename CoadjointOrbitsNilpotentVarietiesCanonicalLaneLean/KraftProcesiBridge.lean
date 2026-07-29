import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean.CoadjointOrbitStructure
import HautevilleHouse.CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean.NilpotentVarietyGeometry

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean

structure KraftProcesiBridgePackage where
  orbit : CoadjointOrbitPackage
  variety : NilpotentVarietyPackage
  momentumMap : orbit.dualSpace → variety.lieAlgebra
  normalizationCompatibility : Prop
  orbitVarietyCorrespondence : Prop

structure KraftProcesiBridgeEvidence (K : KraftProcesiBridgePackage) where
  normalizationCompatibilityClosed : K.normalizationCompatibility
  orbitVarietyCorrespondenceClosed : K.orbitVarietyCorrespondence

def KraftProcesiBridgeClosed (K : KraftProcesiBridgePackage) : Prop :=
  K.normalizationCompatibility ∧ K.orbitVarietyCorrespondence

theorem kraft_procesi_bridge_closed_from_evidence (K : KraftProcesiBridgePackage)
    (E : KraftProcesiBridgeEvidence K) : KraftProcesiBridgeClosed K := by
  exact And.intro E.normalizationCompatibilityClosed E.orbitVarietyCorrespondenceClosed

end CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean
end HautevilleHouse
