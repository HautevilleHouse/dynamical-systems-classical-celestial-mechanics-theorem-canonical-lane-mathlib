import dynamicalSystemTheory

namespace HautevilleHouse
namespace DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean

structure HamiltonianSystem where
  phaseSpace : Type u
  symplecticForm : phaseSpace × phaseSpace → ℝ
  hamiltonian : phaseSpace → ℝ
  vectorField : phaseSpace → phaseSpace
  flow : ℝ → phaseSpace → phaseSpace
  flowPreservesForm : ∀ (t : ℝ) (x : phaseSpace), symplecticForm (flow t x) = symplecticForm x
  energyConservation : ∀ (x : phaseSpace), hamiltonian (flow 0 x) = hamiltonian x

def HamiltonianClosed (H : HamiltonianSystem) : Prop :=
  H.flowPreservesForm (0) ∧ H.energyConservation

end DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean
end HautevilleHouse
