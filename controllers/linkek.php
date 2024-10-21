<?php

class Linkek_Controller
{
    public $baseName = 'linkek';  //meghat�rozni, hogy melyik oldalon vagyunk
    public function main(array $vars) // a router �ltal tov�bb�tott param�tereket kapja
    {
        $view = new View_Loader($this->baseName . '_main');
    }
}
