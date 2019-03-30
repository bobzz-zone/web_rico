<?php

error_reporting(E_ALL);
ini_set('display_errors', TRUE);
ini_set('display_startup_errors', TRUE);
/** Include PHPExcel */
require_once 'excel/PHPExcel.php';
$objPHPExcel = new PHPExcel(); // Create new PHPExcel object
$objPHPExcel->getProperties()->setCreator("Sigit prasetya n")
                             ->setLastModifiedBy("Sigit prasetya n")
                             ->setTitle("Creating file excel with php Test Document")
                             ->setSubject("Creating file excel with php Test Document")
                             ->setDescription("How to Create Excel file from PHP with PHPExcel 1.8.0 Classes by seegatesite.com.")
                             ->setKeywords("phpexcel")
                             ->setCategory("Test result file");

$objPHPExcel->setActiveSheetIndex(0)->setCellValue("A1", "Laporan Pagu Per Satuan Kerja");
$objPHPExcel->setActiveSheetIndex(0)->setCellValue("A2", "Kementerian Desa, Pembangunan Daerah Tertinggal dan Transmigrasi");
$objPHPExcel->setActiveSheetIndex(0)->setCellValue("A4", "Posisi : 21 Januari 2016");
$style = array(
        'alignment' => array(
            'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
        )
    );

$objPHPExcel->setActiveSheetIndex(0)->getStyle("A1:E2")->applyFromArray($style);


// Create Header
$objPHPExcel->setActiveSheetIndex(0)
            ->setCellValue('A5', 'NO')
            ->setCellValue('B5', 'PRODUCT CODE')
            ->setCellValue('C5', 'TITLE');
$default_border = array(
    'style' => PHPExcel_Style_Border::BORDER_THIN,
    'color' => array('rgb'=>'000000')
);			
$style_header = array(
    'borders' => array(
        'bottom' => $default_border,
        'left' => $default_border,
        'top' => $default_border,
        'right' => $default_border,
    ),
    'fill' => array(
        'type' => PHPExcel_Style_Fill::FILL_SOLID,
        'color' => array('rgb'=>'DDDDDD'),
    ),
    'font' => array(
        'bold' => true,
        'size' => 12,
    )
);			
$objPHPExcel->getActiveSheet()->getStyle('A5:C5')->applyFromArray( $style_header ); // give style to header
// Create Data
$dataku=array(
              array('C001','Iphone 6'),
              array('C002','Samsung Galaxy S4'),
              array('C003','Nokia Lumia'),
              array('C004','Blackberry Curve'));
$firststyle='A2';
$a= 6;
for($i=0;$i<count($dataku);$i++)
{
    $urut=$i+6;
    $num='A'.$urut;
    $code='B'.$urut;
    $title='C'.$urut;
	$a++;
    $objPHPExcel->setActiveSheetIndex(0)
            ->setCellValue($num, $i+1)
            ->setCellValue($code, $dataku[$i][0])
            ->setCellValue($title, $dataku[$i][1]);
    $laststyle=$title;
}
$a=$a+2;
$gdImage = imagecreatefromjpeg('bedel.jpg');

$objDrawing = new PHPExcel_Worksheet_MemoryDrawing();
$objDrawing->setName('Sample image');
$objDrawing->setDescription('Sample image');
$objDrawing->setImageResource($gdImage);
$objDrawing->setRenderingFunction(PHPExcel_Worksheet_MemoryDrawing::RENDERING_JPEG);
$objDrawing->setMimeType(PHPExcel_Worksheet_MemoryDrawing::MIMETYPE_DEFAULT);
//$objDrawing->setHeight(150);
$objDrawing->setCoordinates('A'.$a);
$objDrawing->setWorksheet($objPHPExcel->getActiveSheet());

 
// Rename worksheet
$objPHPExcel->getActiveSheet()->setTitle('Product');
// Set active sheet index to the first sheet, so Excel opens this as the first sheet
$objPHPExcel->setActiveSheetIndex(0);
$objPHPExcel->setActiveSheetIndex(0)->mergeCells('A1:E1');
$objPHPExcel->setActiveSheetIndex(0)->mergeCells('A2:E2');
$objPHPExcel->setActiveSheetIndex(0)->mergeCells('A4:E4');


// Redirect output to a client’s web browser (Excel5)
header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="listproduct.xls"'); // file name of excel
header('Cache-Control: max-age=0');
// If you're serving to IE 9, then the following may be needed
header('Cache-Control: max-age=1');
// If you're serving to IE over SSL, then the following may be needed
header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT'); // always modified
header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
header ('Pragma: public'); // HTTP/1.0
 
$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
$objWriter->save('php://output');
exit;
?>