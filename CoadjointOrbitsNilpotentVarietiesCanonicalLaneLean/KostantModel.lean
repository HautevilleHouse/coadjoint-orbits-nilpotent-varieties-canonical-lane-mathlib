import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarieties

structure KostantModelPackage where
  lieAlgebra : Type u
  weylGroup : Type v
  principalNilpotentOrbit : Type w
  dicksonInvariants : Prop
  sl2TripleConstructed : Prop
  orbitCoordinateIsomorphism : Prop
  modelMapDefined : Prop

structure KostantModelEvidence (K : KostantModelPackage) where
  dicksonInvariantsClosed : K.dicksonInvariants
  sl2TripleConstructedClosed : K.sl2TripleConstructed
  orbitCoordinateIsomorphismClosed : K.orbitCoordinateIsomorphism
  modelMapDefinedClosed : K.modelMapDefined

def KostantModelClosed (K : KostantModelPackage) : Prop :=
  K.dicksonInvariants ∧ K.sl2TripleConstructed ∧ K.orbitCoordinateIsomorphism ∧ K.modelMapDefined

theorem kostant_model_closed_from_evidence (K : KostantModelPackage) (E : KostantModelEvidence K) :
    KostantModelClosed K := by
  exact And.intro E.dicksonInvariantsClosed
    (And.intro E.sl2TripleConstructedClosed
      (And.intro E.orbitCoordinateIsomorphismClosed E.modelMapDefinedClosed))

end CoadjointOrbitsNilpotentVarieties
end HautevilleHouse
