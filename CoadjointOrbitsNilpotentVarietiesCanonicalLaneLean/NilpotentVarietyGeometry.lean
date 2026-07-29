import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean

structure NilpotentVarietyPackage where
  lieAlgebra : Type u
  nilpotentCone : Set (LieAlgebra.toModule lieAlgebra)
  varietyStructure : Prop
  reducedness : Prop
  irreducibility : Prop
  normalization : Prop

structure NilpotentVarietyEvidence (N : NilpotentVarietyPackage) where
  varietyStructureClosed : N.varietyStructure
  reducednessClosed : N.reducedness
  irreducibilityClosed : N.irreducibility
  normalizationClosed : N.normalization

def NilpotentVarietyClosed (N : NilpotentVarietyPackage) : Prop :=
  N.varietyStructure ∧ N.reducedness ∧ N.irreducibility ∧ N.normalization

theorem nilpotent_variety_closed_from_evidence (N : NilpotentVarietyPackage)
    (E : NilpotentVarietyEvidence N) : NilpotentVarietyClosed N := by
  exact And.intro E.varietyStructureClosed
    (And.intro E.reducednessClosed
      (And.intro E.irreducibilityClosed E.normalizationClosed))

end CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean
end HautevilleHouse
