import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarieties

structure LusztigCanonicalBasisPackage where
  universalEnvelopingAlgebra : Type u
  canonicalBasis : Type v
  barInvariance : Prop
  positivityOfStructureConstants : Prop
  monomialBasisSpecialization : Prop
  quantumGroupCompatibility : Prop
  nilpotentOrbitInterpretation : Prop

structure LusztigCanonicalBasisEvidence (L : LusztigCanonicalBasisPackage) where
  barInvarianceClosed : L.barInvariance
  positivityOfStructureConstantsClosed : L.positivityOfStructureConstants
  monomialBasisSpecializationClosed : L.monomialBasisSpecialization
  quantumGroupCompatibilityClosed : L.quantumGroupCompatibility
  nilpotentOrbitInterpretationClosed : L.nilpotentOrbitInterpretation

def LusztigCanonicalBasisClosed (L : LusztigCanonicalBasisPackage) : Prop :=
  L.barInvariance ∧ L.positivityOfStructureConstants ∧
  L.monomialBasisSpecialization ∧ L.quantumGroupCompatibility ∧
  L.nilpotentOrbitInterpretation

theorem lusztig_canonical_basis_closed_from_evidence (L : LusztigCanonicalBasisPackage) (E : LusztigCanonicalBasisEvidence L) :
    LusztigCanonicalBasisClosed L := by
  exact And.intro E.barInvarianceClosed
    (And.intro E.positivityOfStructureConstantsClosed
      (And.intro E.monomialBasisSpecializationClosed
        (And.intro E.quantumGroupCompatibilityClosed E.nilpotentOrbitInterpretationClosed)))

end CoadjointOrbitsNilpotentVarieties
end HautevilleHouse
