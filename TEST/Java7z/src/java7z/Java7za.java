/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package java7z;

import java.io.File;
import static java7z.LzmaAlone.PrintHelp;

/**
 *
 * @author QUANT
 */



public class Java7za {

    public static boolean setCurrentDirectory(String directory_name)
    {
        boolean result = false;  // Boolean indicating whether directory was set
        File    directory;       // Desired current working directory

        directory = new File(directory_name).getAbsoluteFile();
        if (directory.exists() || directory.mkdirs())
        {
            result = (System.setProperty("user.dir", directory.getAbsolutePath()) != null);
        }

        return result;
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws Exception {
      //  String vDir = System.getProperty("user.dir");
      //  setCurrentDirectory("c:\\tmp\\Java7z\\test\\");
        String[] fff = {"e","c:\\tmp\\Java7z\\test\\1234567.txt","c:\\tmp\\Java7z\\test\\1234567.7z"};  //  7z a 1 Java_SE6.djvu
        mains( fff ); 
      //  setCurrentDirectory(vDir);
    }
    
    public static void mains(String[] args) throws Exception {
        System.out.println("\nLZMA (Java) 4.61  2008-11-23\n");
	
     //   String args = "";	
        
        if (args.length < 1)
        {
                PrintHelp();
                return;
        }

        LzmaAlone.CommandLine params = new LzmaAlone.CommandLine();
        if (!params.Parse(args))
        {
                System.out.println("\nIncorrect command");
                return;
        }

        if (params.Command == LzmaAlone.CommandLine.kBenchmak)
        {
                int dictionary = (1 << 21);
                if (params.DictionarySizeIsDefined)
                        dictionary = params.DictionarySize;
                if (params.MatchFinder > 1)
                        throw new Exception("Unsupported match finder");
                LzmaBench.LzmaBenchmark(params.NumBenchmarkPasses, dictionary);
        }
        else if (params.Command == LzmaAlone.CommandLine.kEncode || params.Command == LzmaAlone.CommandLine.kDecode)
        {
                java.io.File inFile = new java.io.File(params.InFile);
                java.io.File outFile = new java.io.File(params.OutFile);

                java.io.BufferedInputStream inStream  = new java.io.BufferedInputStream(new java.io.FileInputStream(inFile));
                java.io.BufferedOutputStream outStream = new java.io.BufferedOutputStream(new java.io.FileOutputStream(outFile));

                boolean eos = false;
                if (params.Eos)
                        eos = true;
                if (params.Command == LzmaAlone.CommandLine.kEncode)
                {
                        LZMA.Encoder encoder = new LZMA.Encoder();
                        if (!encoder.SetAlgorithm(params.Algorithm))
                                throw new Exception("Incorrect compression mode");
                        if (!encoder.SetDictionarySize(params.DictionarySize))
                                throw new Exception("Incorrect dictionary size");
                        if (!encoder.SetNumFastBytes(params.Fb))
                                throw new Exception("Incorrect -fb value");
                        if (!encoder.SetMatchFinder(params.MatchFinder))
                                throw new Exception("Incorrect -mf value");
                        if (!encoder.SetLcLpPb(params.Lc, params.Lp, params.Pb))
                                throw new Exception("Incorrect -lc or -lp or -pb value");
                        encoder.SetEndMarkerMode(eos);
                        encoder.WriteCoderProperties(outStream);
                        long fileSize;
                        if (eos)
                                fileSize = -1;
                        else
                                fileSize = inFile.length();
                        for (int i = 0; i < 8; i++)
                                outStream.write((int)(fileSize >>> (8 * i)) & 0xFF);
                        encoder.Code(inStream, outStream, -1, -1, null);
                }
                else
                {
                        int propertiesSize = 5;
                        byte[] properties = new byte[propertiesSize];
                        if (inStream.read(properties, 0, propertiesSize) != propertiesSize)
                                throw new Exception("input .lzma file is too short");
                        LZMA.Decoder decoder = new LZMA.Decoder();
                        if (!decoder.SetDecoderProperties(properties))
                                throw new Exception("Incorrect stream properties");
                        long outSize = 0;
                        for (int i = 0; i < 8; i++)
                        {
                                int v = inStream.read();
                                if (v < 0)
                                        throw new Exception("Can't read stream size");
                                outSize |= ((long)v) << (8 * i);
                        }
                        if (!decoder.Code(inStream, outStream, outSize))
                                throw new Exception("Error in data stream");
                }
                outStream.flush();
                outStream.close();
                inStream.close();
        }
        else
                throw new Exception("Incorrect command");
        return;
	
    }
    
}