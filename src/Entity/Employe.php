<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\EmployeRepository")
 */
class Employe
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="integer")
     */
    private $matricule;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $NomComplet;

    /**
     * @ORM\Column(type="datetime")
     */
    private $dateNaissance;

    /**
     * @ORM\Column(type="integer")
     */
    private $salaire;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Service", inversedBy="employes")
     * @ORM\JoinColumn(nullable=false)
     */
    private $service;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getMatricule(): ?int
    {
        return $this->matricule;
    }

    public function setMatricule(int $matricule): self
    {
        $this->matricule = $matricule;

        return $this;
    }

    public function getNomComplet(): ?string
    {
        return $this->NomComplet;
    }

    public function setNomComplet(string $NomComplet): self
    {
        $this->NomComplet = $NomComplet;

        return $this;
    }

    public function getDateNaissance(): ?\DateTimeInterface
    {
        return $this->dateNaissance;
    }

    public function setDateNaissance(\DateTimeInterface $dateNaissance): self
    {
        $this->dateNaissance = $dateNaissance;

        return $this;
    }

    public function getSalaire(): ?int
    {
        return $this->salaire;
    }

    public function setSalaire(int $salaire): self
    {
        $this->salaire = $salaire;

        return $this;
    }

    public function getService(): ?Service
    {
        return $this->service;
    }

    public function setService(?Service $service): self
    {
        $this->service = $service;

        return $this;
    }
}
