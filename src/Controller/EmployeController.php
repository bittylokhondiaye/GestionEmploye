<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\Form\FormTypeInterface;
use App\Repository\EmployeRepository;
use App\Repository\ServiceRepository;
use App\Entity\Employe;
use App\Entity\Service;

class EmployeController extends AbstractController
{
    /**
     * @Route("/employe", name="employe")
     */
    public function index()
    {
        $repo=$this->getDoctrine()->getRepository(Employe::class);
        $employes=$repo->findAll();
        
        return $this->render('employe/index.html.twig', [
            'controller_name' => 'EmployeController',
            'employes' => $employes
        ]);
    }

    /**
     * @Route("/",name="home")
     */
     

    public function home(){
        return $this->render('employe/home.html.twig');
    }

    /**
     * @Route("/employe/new",name="newEmploye")
     * @Route("/employe/{id}/update",name="updateEmploye")
     */

    public function form(Employe $employe = null,Request $request, ObjectManager $manager){
        if(!$employe){
            $employe= new employe();
        }

        $form =  $this->createFormBuilder($employe)
                ->add('matricule')
                ->add('nom_complet')
                ->add('date_naissance', DateType::class,[
                    'widget'=>'single_text',
                    'format'=>'yyyy-MM-dd',
                ])
                ->add('salaire')
                ->add('service', EntityType::class,[ 
                    'class'=>Service::class,
                    'choice_label' =>'libelle'
                ])
                
                ->getForm();

                $form->handleRequest($request);

                if($form->isSubmitted() && $form->isValid()){
                    $manager->persist($employe);
                    $manager->flush();

                    return $this->redirectToRoute('employe',['id' => $employe->getId()]);
                }

                return $this->render('employe/ajout.html.twig', [ 'formEmploye' => $form->createView()]);
    }

    /**
     * @Route("/employe/{id}/delete",name="deleteEmploye")
     */

    public function delete(Employe $employe,ObjectManager $manager){
        /* $Employemanager->getDoctrine()->getManager(); */
        $manager->remove($employe);
        $manager->flush();
        
        return $this->redirectToRoute('employe',['id' => $employe->getId()]);

    }

    /**
     *@Route("/employe/service", name="service")
     */
    public function service()
    {
        $repo=$this->getDoctrine()->getRepository(Service::class);
        $services=$repo->findAll();
        return $this->render('employe/service.html.twig', [
            'controller_name' => 'EmployeController',
            'services' => $services
        ]);
    }

    
}
