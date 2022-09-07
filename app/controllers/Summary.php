<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Summary extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('customers_model', 'customers');
        $this->load->model('requests_model');
        $this->load->model('reports_model', 'reports');
        $this->load->model('summary_model', 'summary');
        $this->load->model('employee_model');
        $this->load->model('send_message');
    }

    public function sendSummary()
    {

        //var_dump($tot);die;
        $time = date("h:i:sa");
        //$tm = "06:36:02pm";

        $smsadmins = $this->employee_model->fetch_admin();
        $rec = $smsadmins['recipients'];
        
         $msg = "AUTOMATED DAILY REPORTS
Embroidery
Today's Income $todaySales

GRAND TOTALS:
Total Income $paidUnpaid
Outstanding Debts: $totalDue
Paid Debts $totalIncome";
//var_dump($msg);die;

        $this->send_message->send($msg, $rec);
    }
	
}
