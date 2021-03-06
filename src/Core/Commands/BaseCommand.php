<?php

namespace SatCMS\Core\Commands;

/*
use SatCMS\Core\Abstract\Runner as CommandRunner;
*/

use \core;
use Symfony\Component\Console\Command\Command as CommandRunner;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Output\OutputInterface;

abstract class BaseCommand extends CommandRunner {

    protected $name         = 'Empty-Name';
    protected $description  = 'Empty-Description';

    protected function configure() {

        $this->setName($this->name)
            ->setDescription($this->description)
            ->addOption('database', null, InputOption::VALUE_OPTIONAL, 'database=... (default/test/sqlite/...)')
            ->addOption('env', null, InputOption::VALUE_OPTIONAL, 'environment (default/test/sqlite/...)')
            ->addOption('dry-run',  null, InputOption::VALUE_OPTIONAL, 'dry run', false)
        ;

    }

    /**
     * @return core
     */
    function core() {
        return \core::get_instance(true);
    }

    function env($id) {
        return \core::get_instance();
    }

    function prepare_db($id) {
        if ($id) {
            $this->core()->configure_database($id);
        }
    }

}