<?php

namespace App\DataFixtures;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;
use App\Entity\Employe;

class EmployeFixtures extends Fixture
{
    public function load(ObjectManager $manager)
    {
        // $product = new Product();
        // $manager->persist($product);
        for($i=1;$i<5;$i++){
            $employe=new Employe();
            $employe->setMatricule(45781);
            $employe->setNomComplet("Nom complet de l'employe N $i");
            $employe->setDateNaissance(new \DateTime());
            $employe->setSalaire(7856);

                    $manager->persist($employe);
        }
        
        $manager->flush();
    }
}
