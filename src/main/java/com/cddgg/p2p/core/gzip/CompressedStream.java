package com.cddgg.p2p.core.gzip;

import java.io.IOException;
import java.util.zip.GZIPOutputStream;

import javax.servlet.ServletOutputStream;

/**   
 * Filename:    CompressedStream.java   
 * @version:    1.0   
 * @since:  JDK 1.7.0_25  
 * Create at:   2014年4月9日 下午1:54:14   
 * Description:  
 *   
 */

public class CompressedStream extends ServletOutputStream {

    private ServletOutputStream out;
    private GZIPOutputStream    gzip;
    
    /**   
          * 指定压缩缓冲流   
          * @param 输出流到压缩   
          * @throws IOException if an error occurs with the {@link GZIPOutputStream}.   
          */    
        public CompressedStream(ServletOutputStream out) throws IOException {    
             this.out = out;    
            reset();    
         }    
        /** @see ServletOutputStream * */    
        public void close() throws IOException {    
                gzip.close();    
       } 
        /** @see ServletOutputStream * */    
        public void flush() throws IOException {    
            gzip.flush();    
        }    
        
        /** @see ServletOutputStream * */    
        public void write(byte[] b) throws IOException {    
            write(b, 0, b.length);    
        }
        
        /** @see ServletOutputStream * */    
        public void write(byte[] b, int off, int len) throws IOException {    
            gzip.write(b, off, len);    
        }
        
        /** @see ServletOutputStream * */    
        public void write(int b) throws IOException {
            gzip.write(b);    
        }
        
        /**   
        * Resets the stream.   
        *    
        * @throws IOException if an I/O error occurs.   
        */    
        public void reset() throws IOException {    
            gzip = new GZIPOutputStream(out);    
        }  

}

