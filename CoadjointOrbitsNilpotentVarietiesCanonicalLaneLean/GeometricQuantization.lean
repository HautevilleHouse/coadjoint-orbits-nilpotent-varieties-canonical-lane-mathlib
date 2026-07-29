import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean.CoadjointOrbitStructure

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean

structure GeometricQuantization (L : NilpotentLieAlgebra) where
  orbit : CoadjointOrbit L L.field
  prequantumLineBundle : Prop
  polarization : Prop
  hilbertSpace : Prop
  quantizationMap : Prop
  equivariance : Prop

structure GeometricQuantizationEvidence {L : NilpotentLieAlgebra} (G : GeometricQuantization L) where
  prequantumLineBundleClosed : G.prequantumLineBundle
  polarizationClosed : G.polarization
  hilbertSpaceClosed : G.hilbertSpace
  quantizationMapClosed : G.quantizationMap
  equivarianceClosed : G.equivariance

def GeometricQuantizationClosed {L : NilpotentLieAlgebra} (G : GeometricQuantization L) : Prop :=
  G.prequantumLineBundle ∧ G.polarization ∧ G.hilbertSpace ∧ G.quantizationMap ∧ G.equivariance

theorem geometric_quantization_closed {L : NilpotentLieAlgebra} (G : GeometricQuantization L) (E : GeometricQuantizationEvidence G) : GeometricQuantizationClosed G := by
  exact And.intro E.prequantumLineBundleClosed (And.intro E.polarizationClosed (And.intro E.hilbertSpaceClosed (And.intro E.quantizationMapClosed E.equivarianceClosed)))

end CoadjointOrbitsNilpotentVarietiesCanonicalLaneLean
end HautevilleHouse
